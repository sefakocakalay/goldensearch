figure; hold on;

a=-0.60;                            
b=2.80;                      
epsilon=0.05;               
iter= 10;                       
tau=double((sqrt(5)-1)/2);     
k=0;                            


x1=a+(1-tau)*(b-a);         
x2=a+tau*(b-a);

f_x1=f(x1);                    
f_x2=f(x2);                       

plot(x1,f_x1,'rx');            
plot(x2,f_x2,'rx');


while ((abs(b-a)>epsilon) && (k<iter))
    k=k+1;
    if(f_x1>f_x2)
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
      
        f_x1=f(x1);
        f_x2=f(x2);
        plot(x1,f_x1,'rx');
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
      
        f_x1=f(x1);
        f_x2=f(x2);
        plot(x2,f_x2,'rx')
    end
  
    sprintf('Iteration %d: x1=%f, f(x1)=%f, x2=%f, f(x2)=%f', k, x1, f_x1, x2, f_x2)
end



if(f_x1<f_x2)
    sprintf('x_max=%f', x1)
    sprintf('f(x_max)=%f ', f_x1)
    plot(x1,f_x1,'ro')
else
    sprintf('x_max=%f', x2)
    sprintf('f(x_max)=%f ', f_x2)
    plot(x2,f_x2,'ro')
end
