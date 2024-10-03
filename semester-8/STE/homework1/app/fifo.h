/*
 * fifo.h
 *
 *  Created on: Dec 7, 2021
 *      Author: arliones
 */

#ifndef __FIFO_H__
#define __FIFO_H__

template<typename T, int S>
class Fifo
{
public:
  enum Fifo_Errors_t
    {
    FIFO_ERROR_FULL  = -2,
    FIFO_ERROR_EMPTY = -1,
    FIFO_SUCCESS  = 0
  };

  Fifo()
  {
    Clear();
  }

  ~Fifo()
  {}

  int Push(T d)
  {
    if (_size == S) return FIFO_ERROR_FULL;

    _buffer[_in] = d;
    _in = (_in + 1) % S;
    _size++;

    return FIFO_SUCCESS;
  }

  int Pop(T * d)
  {
    if (this->Size() == 0)
    {
      return FIFO_ERROR_EMPTY;
    }

    *d = _buffer[_out];
    _out = (_out + 1) % S;
    _size--;

    return FIFO_SUCCESS;
  }

  void Clear()
  {
    _in = 0;
    _out = 0;
    _size = 0;
  }

  inline int Size() { return _size; }
  inline const int Capacity() { return S; }

private:
  T _buffer[S];
  unsigned char _in, _out, _size;
};

#endif /* __FIFO_H__ */