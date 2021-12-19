clc
clear all
syms x
pkg load symbolic
f = x.*sin(pi.*x)
f = (sym) x*sin(pi.*x)