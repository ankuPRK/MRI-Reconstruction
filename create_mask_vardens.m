function [M, pdf_vardens] = create_mask_vardens(Side, DSFactor)
    Dist = zeros(Side, Side);
    center = Side/2.0 + 0.5;

%     p = 0.5*(3.0/DSFactor - 1);
%     for i=1:1:Side
%         for j=1:1:Side
%             Dist2(i,j) = sqrt((i-center)^2 + (j-center)^2);
%         end
%     end
%     pdf_vardens2 = 1.0 - Dist2*(1.0 - p)/Side;

    var = Side/0.01/sqrt(2.0*DSFactor*pi);
    for i=1:1:Side
        for j=1:1:Side
            Dist(i,j) = (i-center)^2 + (j-center)^2;
        end
    end
    pdf_vardens = 0.02 + 0.98*exp(-0.5* Dist / var);
%    pdf_vardens = 0.5*(pdf_vardens1 + pdf_vardens2);
    Full = ones(Side, Side);
    M = binornd(Full, pdf_vardens);
end
