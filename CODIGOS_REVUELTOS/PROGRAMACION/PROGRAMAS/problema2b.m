## Copyright (C) 2015 CAE CCC 02
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} problema2b (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CAE CCC 02 <CAE CCC 02@CAECCC02-HP>
## Created: 2015-12-16

function [matrizsup, matrizinf, diagonalvector] = problema2b (cuadrada)
  [filas, columnas]=size(cuadrada);
  %validacion filas y columnas
  cont=1;
  if filas==columnas
    %obtenemos la diagonal
    for i=1:filas
      for j=1:columnas
        if i==j
          diagonalvector(cont)=cuadrada(i,j);
          cont=cont+1;
        end
      end
    end    
    %obtenemos la matriz inferiorto
    for i=1:filas
      for j=1:columnas
        if i>=j
          matrizsup(i,j)=cuadrada(i,j);
        else
          matrizsup(i,j)=0;
        end
      end
    end   
    %obtenemos la matriz superior
    for i=1:filas
      for j=1:columnas
        if i<=j
          matrizinf(i,j)=cuadrada(i,j);
        else
          matrizinf(i,j)=0;
        end
      end
    end   
  end
endfunction
