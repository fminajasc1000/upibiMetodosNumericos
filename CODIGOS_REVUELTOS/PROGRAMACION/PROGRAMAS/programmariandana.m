function [mat, p, np] = separar(mat)
[a,b]=size(mat);
auxp=1;
auxnp=1;
for i=1:a
  for j=1:b
    if mod(mat(i,j),2)==0
      p(auxp)=mat(i,j);
      auxp=auxp+1;
     else
      if rem(mat(i,j),1)==0
        np((auxnp)=mat(i,j);
        auxnp=auxnp+1;
      end
    end
  end
end