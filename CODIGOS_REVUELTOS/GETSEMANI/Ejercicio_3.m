clc
clear all;
close all;

f =@(t) 80 * exp (-2 * t) + 20 * exp (-0.5 * t) - 7;
syms t
f=f(t)
x1=2;
x2=x1-subs(f,x1)/subs(diff(f),x1)