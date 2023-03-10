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

function [index] = vz_array_findNearest(array,value)
%vz_array_findNearest(array,value) find the nearest value from the provided
%array to the given value. Return the index from the array.

    index = 1;
    dist0 = abs(array(1)-value);
    for i=2:length(array)
        
        dist = abs(array(i)-value);
        if(dist<dist0) 
           index = i;
           dist0 = dist;
        end
    end
%     
%    if(value<array(1))
%        index = 1;
%    elseif(value>array(end))
%       index = length(array); 
%    end

end

