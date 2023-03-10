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

function COM = vz_phys_centerOfMass(vector_list,mass_list)
%vz_phys_centerOfMass(vector_list,mass_list) calculate the center of mass
%of multiple objects
%   vector_list : list of \vect{CG} of 2D or 3D coordinates as [X1 Y1 Z1 ; X2 Y2 Z2 ; ...]
%   mass_list : corresponding mass to each position vector [m1 ; m2 ; ...]
%   Warning : pay attention to have the same reference frame for all the
% vectors

    COM = sum(mass_list.*vector_list)/sum(mass_list);

end

