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

function [arrayC0] = vz_array_makeContinu(array,varargin)
%vz_array_makeContinu Make an array continious
%vz_array_makeContinu(array)
% Options : 'cut' removed the discontinuitie instead of rearanging it
%           'var' specify maximum variation of the function (default 5)
%           (smaller value means accepting bigger variations)
%           'cycle N' make recursive until the max number of cycles N
    varValue = 5;
    cutValue = 0;
    cycleTimeout = 0;
    
    varVar = find(strcmp(varargin,'var'));
    varCut = find(strcmp(varargin,'cut'));
    varCycle = find(strcmp(varargin,'cycle'));
    if(~isempty(varVar)), varValue=varargin{varVar+1};end
    if(~isempty(varCut)), cutValue=1;end
    if(~isempty(varCycle)), cycleTimeout=varargin{varCycle+1};end

    arrayC0 = array;
    
    while(cycleTimeout>1)
        if(length(arrayC0)==size(arrayC0,1))
            darray = abs(diff(arrayC0(:,1)));
            if(max(darray) > varValue*mean(darray))
                splitValue = find(darray==max(darray));
                if(cutValue)
                    arrayC0 = arrayC0(1:splitValue,:);
                else
                    arrayC0 = [arrayC0(splitValue+1:end,:); arrayC0(1:splitValue,:)];
                end
            end
        else
            darray = abs(diff(arrayC0(1,:)));
            if(max(darray) > varValue*mean(darray))
                splitValue = find(darray==max(darray));
                if(cutValue) 
                    arrayC0 = arrayC0(:,1:splitValue);
                else
                    arrayC0 = [arrayC0(:,splitValue+1:end) arrayC0(:,1:splitValue)];
                end
            end
        end
        cycleTimeout = cycleTimeout-1;
    end
    

end

