#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

#define SIZE 128

int myopen (const char *filename, int flags, int size);
ssize_t myread(int fd, void *buf);
ssize_t mywrite(int fd, const void *buf, size_t count);
int myclose(int fd);

int myopen (const char *filename, int flags, int buffersize) {

  asm volatile ("mov $2, %rax");
  asm volatile ("mov %0, %%rdi" : /* saida */ : "g" (filename) );
  asm volatile ("mov %0, %%esi" : /* saida */ : "g" (flags) );
  asm volatile ("mov %0, %%edx" : /* saida */ : "g" (buffersize) );
  asm volatile ("syscall");

  int retorno_open;  
  asm volatile ("mov %%eax, %0" : "=r"(retorno_open) : /* entrada */);

  return retorno_open;
}

ssize_t myread(int fd, void *buf) {

  asm volatile ("mov $0, %rax");
  asm volatile ("mov %0, %%edi" : /* saida */ : "g" (fd) );
  asm volatile ("mov %0, %%rsi" : /* saida */ : "g" (buf) );
  asm volatile ("mov %0, %%edx" : /* saida */ : "g" (SIZE) );
  asm volatile ("syscall");

  int retorno_read;
  asm volatile ("mov %%eax, %0" : "=r"(retorno_read) : /* entrada */);

  return retorno_read;
}

ssize_t mywrite(int fd, const void *buf, size_t count) {

  asm volatile ("mov $1, %rax");
  asm volatile ("mov %0, %%edi" : /* saida */ : "g" (fd) );
  asm volatile ("mov %0, %%rsi" : /* saida */ : "g" (buf) );
  asm volatile ("mov %0, %%rdx" : /* saida */ : "g" (count) );
  asm volatile ("syscall");

  int retorno_write;
  asm volatile ("mov %%eax, %0" : "=r"(retorno_write) : /* entrada */);

  return retorno_write;
 
}

int myclose(int fd) {

  asm volatile ("mov $3, %rax");
  asm volatile ("mov %0, %%edi" : /*saidas*/ : "r" (fd));
  asm volatile ("syscall");

  int retorno_close; 
  asm volatile ("mov %%eax, %0" : "=r" (retorno_close) : /*entradas*/);

  return retorno_close; 
}

int main (int argc, char** argv) {

  int file;
  char buf[SIZE];
  ssize_t readCount;

  if (argc != 2) {
    fprintf(stderr,"correct usage: %s <filename>\n", argv[0]);
    return 1;
  }

  file = myopen (argv[1], O_RDONLY, SIZE);
  if (file<0) { perror("file open"); return 1;}

  while ((readCount = myread (file, buf)) > 0)
    if ((mywrite (STDOUT_FILENO, buf, readCount) != readCount))
      { perror("write"); return 1;}

  myclose (file);
  return 0;

}