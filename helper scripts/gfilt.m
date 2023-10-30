function y = gfilt(x,fs,sd,sdextra);
if nargin<4, sdextra=5; end;
%  Gaussian smoothing filter
%
%  x = input data
% fs = sample frequency (Hz)
% sd = standard deviation
% sdextra = number of sd's added to data edges (5 = default), 
% signal is mirrored
%
% should be samples x dimensions matrix
% (c) Beerend Winkelman 2005


% x=x(:)';
nextra=round(sdextra/2*sd*fs);
[nx,dim]=size(x);
nfft=nx+2*nextra;
a=1./(2.*sd.^2);
if rem(nfft,2),    % nfft odd
   frq=[0:(nfft-1)/2 -((nfft-1)/2:-1:1)]';
else
   frq=[0:nfft/2 -(nfft/2-1:-1:1)]';
end
frq=repmat(frq.*fs./nfft,1,dim);
x=[x;x(end:-1:end-nextra+1,:);x(nextra+1:-1:2,:)]; % mirror edges to go around boundary effects

y = ifft(fft(x,nfft).*exp(-pi^2.*frq.^2./a));
y=y(1:nx,:);
y=abs(y).*sign(real(y));
%y=real(y);

