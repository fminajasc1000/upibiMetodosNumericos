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
## @deftypefn {Function File} {@var{retval} =} distancia (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CAE CCC 02 <CAE CCC 02@CAECCC02-HP>
## Created: 2015-12-16

function [distancia] = distancia (vector)
  %primeramente ordenamos los valores
  longuitud=length(vector);
  control=1;
  for i=1:longuitud-1
    for j=1:longuitud-1
      if vector(j)>vector(j+1);
        aux=vector(j+1);
        vector(j+1)=vector(j);
        vector(j)=aux;
      end
    end
  end
  distancia=zeros;
  %ahora calculamos la distancia
  while control<longuitud
    distancia(control)=abs(vector(control)-vector(control+1));
    control=control+1;
  end
endfunction
