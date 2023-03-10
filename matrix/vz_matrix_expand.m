%% vz_tools toolbox, controls a robotic leg analyse test bench.
%     Copyright (C) 2022-2023  Ilya Brodoline - ISM AMU, Marseille (France).
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <https://www.gnu.org/licenses/>.
% 
% contact: ilya.brodoline@univ-amu.fr

function [matrixExpanded] = vz_matrix_expand(matrix,dim,varargin)
%[matrixExpanded] = vz_matrix_expand(matrix,dim,varargin) increase the size
%of the given matrix, based on extrapolation.
% dim : dimension in which the matrix should be expanded 1 (row) or 2 (column)
% options : 'method' - 'linear' (default)
%                    - 'spline'
%                    - 'previous'	previous non-missing value
%                    - 'next'	next non-missing value
%                    - 'nearest'	nearest non-missing value

    method = 'linear';

    
    varMethod = find(strcmp(varargin,'method'));
    if(~isempty(varMethod)), method=varargin{varMethod+1};end
    
    
    if(dim==1)
        matrixExpanded = [NaN(1,size(matrix,2)) ; matrix];
        matrixExpanded = fillmissing(matrixExpanded,method,1);
    else
        matrixExpanded = [NaN(size(matrix,1),1) matrix];
        matrixExpanded = fillmissing(matrixExpanded,method,2);
    end

    

end

