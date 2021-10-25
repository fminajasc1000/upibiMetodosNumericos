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
## @deftypefn {Function File} {@var{retval} =} mediana (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: CAE CCC 02 <CAE CCC 02@CAECCC02-HP>
## Created: 2015-12-16

function [media] = mediana (vector)
  %primeramente ordenamos los valores
  mediana=0;
  longuitud=length(vector);
  for i=1:longuitud-1
    for j=1:longuitud-1
      if vector(j)>vector(j+1);
        aux=vector(j+1);
        vector(j+1)=vector(j);
        vector(j)=aux;
      end
    end
  end
  %verificamos la longuitd del vector para saber que tecnica de mediana utilizar
  if mod(longuitud,2)==0
    aux2=vector(longuitud/2);
    aux3=vector((longuitud/2)+1);
    mediana=(aux2+aux3)/2;
  else
    mediana=vector(round(longuitud/2)paint);
  end
  media=mediana;
endfunction
