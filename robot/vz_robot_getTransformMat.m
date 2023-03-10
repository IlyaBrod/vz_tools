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

function T = vz_robot_getTransformMat(robot,q,varargin)
%vz_robot_getTransformFull return full transformation matrix from frame 0
%frame 1
% vz_robot_getTransformFull(robot,q)
%Options : start i, startin joint for the transform matrix
%          end j, ending joint for the tranform matrix
    
    start = 1;
    ending = size(q,2);

    varStart = find(strcmp(varargin,'start'));
    varEnding = find(strcmp(varargin,'end'));
    if(~isempty(varStart)), start=varargin{varStart+1};end
    if(~isempty(varEnding)), ending=varargin{varEnding+1};end

    TH = q(1,:);
    T = eye(4,4);
    for i=start:ending
        link = robot.links(i);
        T = T*[cos(TH(i)) -cos(link.alpha)*sin(TH(i)) sin(link.alpha)*sin(TH(i)) link.a*cos(TH(i)) ; ...
            sin(TH(i)) cos(link.alpha)*cos(TH(i)) -sin(link.alpha)*cos(TH(i)) link.a*sin(TH(i)) ; ...
            0 sin(link.alpha) cos(link.alpha) link.d ;...
            0 0 0 1];
    end

end

