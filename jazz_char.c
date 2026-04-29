#include <linux/module.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/device.h>

#define DEVICE_NAME "jazz0"
#define CLASS_NAME  "jazz"

static int major;
static struct class *jazz_class;
static struct device *jazz_device;

static char buffer[256] = "hello from kernel driver\n";
static size_t buffer_len = 25;

static ssize_t jazz_read(struct file *file, char __user *user_buf,
                         size_t count, loff_t *offset)
{
    return simple_read_from_buffer(user_buf, count, offset, buffer, buffer_len);
}

static ssize_t jazz_write(struct file *file, const char __user *user_buf,
                          size_t count, loff_t *offset)
{
    size_t to_copy = min(count, sizeof(buffer) - 1);

    if (copy_from_user(buffer, user_buf, to_copy))
        return -EFAULT;

    buffer[to_copy] = '\0';
    buffer_len = to_copy;

    pr_info("jazz_char: wrote %zu bytes\n", to_copy);
    return to_copy;
}

static const struct file_operations jazz_fops = {
    .owner = THIS_MODULE,
    .read = jazz_read,
    .write = jazz_write,
};

static int __init jazz_init(void)
{
    major = register_chrdev(0, DEVICE_NAME, &jazz_fops);
    if (major < 0)
        return major;

    jazz_class = class_create(CLASS_NAME);
    if (IS_ERR(jazz_class)) {
        unregister_chrdev(major, DEVICE_NAME);
        return PTR_ERR(jazz_class);
    }

    jazz_device = device_create(jazz_class, NULL, MKDEV(major, 0), NULL, DEVICE_NAME);
    if (IS_ERR(jazz_device)) {
        class_destroy(jazz_class);
        unregister_chrdev(major, DEVICE_NAME);
        return PTR_ERR(jazz_device);
    }

    pr_info("jazz_char: loaded with major %d\n", major);
    return 0;
}

static void __exit jazz_exit(void)
{
    device_destroy(jazz_class, MKDEV(major, 0));
    class_destroy(jazz_class);
    unregister_chrdev(major, DEVICE_NAME);
    pr_info("jazz_char: unloaded\n");
}

module_init(jazz_init);
module_exit(jazz_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Jazz");
MODULE_DESCRIPTION("Tiny Linux character driver");
