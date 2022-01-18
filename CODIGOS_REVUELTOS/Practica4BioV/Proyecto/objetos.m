classdef objetos
    properties
        imagen
    end
    methods
      function obj=objetos(v,a)
         v.imagen = a;
         obj=v;
      end
      function imprimir(v)
          imshow(v.imagen);
      end
   end
end