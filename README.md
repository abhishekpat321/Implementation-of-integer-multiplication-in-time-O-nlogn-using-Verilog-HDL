# Implementation-of-integer-multiplication-in-time-O-nlogn-using-Verilog-HDL
Integer multiplication is fundamental operation in computer science and mathematics having major role in algorithms. The algorithm discussed in this project, computes multiplication of two n-bit integers in O(nlogn) bit operations. We will make use of Fast Fourier Transform (FFT) to specially enhance effectiveness by minimizing the time complexity from O(n2) to O(nlogn). This approach proves highly effective, especially when dealing with the multiplication of exceedingly large integers. SchӦnhage–Strassen algorithm gives solution to this NP type problem. After performing FFT, point wise multiplication is to be done in frequency domain which increases algorithm execution time. After converting integers into frequency domain convolution will be carried out. To transform the resulting polynomial back to time domain Inverse Fourier Transform will be applied. This algorithm is applied on Verilog HDL in intel Quartus prime and Modelsim.
