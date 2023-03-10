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

function [sortedA,order] = vz_array_combsort(array)
%[sorted,order] = vz_array_sort(array) sort array in increasing order
%   return sorted : reorganized array
%          order : array of indexes corrresponding to the order
    
    order = 1:numel(array);
    sortedA = array;
    interval = order(end);
    switchV = true;
    
    while(interval>1 || switchV==true)
        interval = floor(interval/1.3);
        if(interval < 1)
            interval = 1;
        end

        switchV = false;
        for i=1:(numel(array)-interval)
            if(sortedA(i) > sortedA(i + interval))
                temp = sortedA(i);
                sortedA(i) = sortedA(i+interval);
                sortedA(i+interval) = temp;
                
                temp = order(i);
                order(i) = order(i+interval);
                order(i+interval) = temp;
                
                switchV = true;
            end
        end
    end

end

