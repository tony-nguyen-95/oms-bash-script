#!/bin/sh

# Print 1 line of space
print_lines() {
    echo "\n"
}

# Function to print current date and time
print_datetime() {
    echo "$(date)"
}

# Function to print current processes
print_processes() {
    echo "Processes:"
    ps | sed 's/^/  /'
}

# Function to print CPU load
print_cpu_load() {
    echo "CPU load:"
    printf "\t"
    uptime
}

# Function to print memory usage
print_memory_status() {
    echo "Memory usage:"
    printf "\t"
    free -g
}

# Function to print kernel version
print_kernel_version() {
    echo "Kernel version:"
    printf "\t"
    uname -v
}

# Call functions to print system information
print_datetime
print_lines
print_processes
print_lines
print_cpu_load
print_lines
print_memory_status
print_lines
print_kernel_version
