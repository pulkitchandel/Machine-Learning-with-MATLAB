%%                         AND gate perceptron
clc; clear all; close all;
%% Inputs and their conditions
x1=[1 1 -1 -1]; %first input vector
x2=[1 -1 1 -1]; %second input vector
t=[1 -1 -1 -1]; %target output vector
w1=0; w2=0; b=0; alpha=1; thetha=0; %initializing weights, bias, learning rate, threshold
flag=0;i=1;
while flag==0 %run until flag = 1
  y = pred(x1(i),x2(i),w1,w2,b);  %calculate the predicted output
  y = set_value(y,thetha);        %update predicted o/p using threshold
  weights=[w1 w2 b y]
  if y==t(i)                      %if predicted = actual
      flag=1; %make flag = 1
  else
      w1 = weight_update(w1,t(i),alpha,x1(i)); %update weights and bias
      w2 = weight_update(w2,t(i),alpha,x2(i));
      b = bias_update(b,t(i),alpha);
  end
  
  if(i==length(t)) %if i exceeds length of output
      i=1;
  else
      i=i+1;
  end
end
final=[w1 w2 b]
%% Equations
function yin = set_value(yin,thr) %function to update yin
  if yin > thr
      yin = 1;
  elseif yin==thr
      yin = 0;
  else
      yin = -1;
  end
end
function y = pred(xi,xj,wi,wj,b) %calculate predicted output
  y = (wi*xi)+(wj*xj)+b;
end

function wnew = weight_update(wold,ti,a,xi) %weight update functiom
  wnew = wold+(a*ti*xi);
end

function bnew = bias_update(bold,ti,a) %bias update function
  bnew = bold+(a*ti);
end
