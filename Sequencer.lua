local class = require 'lib.middleclass'
--The sequencer
local Synthesizer = require 'Synthesizer' -- requires middleclass

local Sequencer = class('Sequencer') -- requires middleclass


function Sequencer:initialize()
  song = {}
  pattern = {}
  chain = {}
  instrument = {}
  effectparams = {}
  
end

--the change functions do double duty
--adds entry when there is none (automatic)
--overrides entry at location
--it may be good to have a cache of recent changes for an undo command

function Sequencer:change_instrument(iNum)
end

function Sequencer:change_chain(cNum)
end

function Sequencer:change_pattern(pNum)
end

function Sequencer:change_song()
end



function Sequencer:play_chain (cNum)
  for i=0,16 do
  end
end

function Sequencer:play_pattern (pNum)
end

function Sequencer:play_song()
  --play each pattern in the song list
  --needs to be done with all channels playing simultaneosly 
  --how good is lua at threading?
  --if we cant thread, then we should not recursively call the other functions,
  --but have the timing delays in this function
end

return Sequencer