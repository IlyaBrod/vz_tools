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

function colorList = vz_color_generateLegend(plotNumber)
%colorList = vz_colors_generateLegend(plotnumber) Generates color list with
%distingished hue color

    colorList = zeros(plotNumber,3);
    
    for i=1:plotNumber
        
        colorList(i,:) = hsv2rgb([i/(plotNumber+1) 1 1]);
    end


end

