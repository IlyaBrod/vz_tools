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

function [time,out] = vz_array_temporalOp(datatime1,datatime2,varargin)
%[time,out] = vz_array_temporalOp(datatime1,datatime2)
%   Calculates a specified operation betwen two vectors [time, value]
%   Calculation is done by align the two vectors temporally
%  options : 'sum' = (1) + (2)
%            'diff' = (1)-(2)
%            'div' = (1)./(2)
%            'prod' = (1).*(2)

      assert(numel(varargin)~=0,'Operation argument (3rd) not specified, see function doc');
      type = varargin{1};

      
      %Align time vectors
      time1 = datatime1(:,1);
      time2 = datatime2(:,1);
      
      t1 = time1(1);
      t2 = time2(1);
      if(t1>t2)
          offsetId = vz_array_findNearest(time2,t1);
          offsetIdEnd = offsetId-1+ (1:min([numel(time1) numel(time2)-offsetId]));
          time = time2(offsetIdEnd);
          valueCut1 = datatime1(1:numel(time),2);
          valueCut2 = datatime2(offsetIdEnd,2);
          
      elseif(t1<t2)
          offsetId = vz_array_findNearest(time1,t2);
          offsetIdEnd = offsetId-1+(1:min([numel(time2) numel(time1)-offsetId+1]));
          time = time1(offsetIdEnd);
          valueCut1 = datatime1(offsetIdEnd,2);
          valueCut2 = datatime2(1:numel(time),2);
          
      else
          offsetId = min([numel(time1) numel(time1)]);
          time = time1(1:offsetId);
          valueCut1 = datatime1(1:offsetId,2);
          valueCut2 = datatime2(1:offsetId,2);
      end
      
      %Proceed operation
      switch(type)
          case 'sum'
              out = valueCut1 + valueCut2;
          case 'diff'
              out = valueCut1 - valueCut2;
          case 'div'
              out = valueCut1 ./ valueCut2;
          case 'prod'
              out = valueCut1 .* valueCut2;
      end

      time = time';
      out = out';
      
end

