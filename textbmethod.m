clear;clc;close all;
%bisection method ok
%ingredients
%f = input('Enter your function=');  %@(x) x·sin(x)
%a = input('Enter left side of interval=');   %0
%b = input('Enter right side of interval=');   %2
%n = input('Enter no of iterations=');   %10
%e= input('Enter tolerance=');      %0,0001
f = @(x) x.*sin(x)-1
c=bmethod(f, 0, 2, 100, 0.001)

