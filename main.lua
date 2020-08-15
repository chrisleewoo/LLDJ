local Synthesizer = require 'Synthesizer' -- requires middleclass
local Sequencer = require 'Sequencer'

current_wavetype = 'square'

function love.load()
	synth = Synthesizer:new('square')
  seq = Sequencer:new()

	keyboard_bind = {z='C', s='C#', x='D', d='D#', c='E', v='F', g='F#', b='G', h='G#', n='A', j='A#', m='B'}
	current_octave = 4
end

waveform_type = 'square'
function love.keypressed(key)
	if keyboard_bind[key] then
		synth:playNote(keyboard_bind[key]..current_octave)
	elseif key == 'up' then
		synth:stopNotesOnOctave(current_octave)
    if current_octave < 8 then
      current_octave = current_octave + 1
    end
	elseif key == 'down' then
		synth:stopNotesOnOctave(current_octave)
    if current_octave > 0 then
      current_octave = current_octave - 1
    end
    
  elseif key == '1' then
    synth:stopNotesOnOctave(current_octave)
    synth:set_wavetype('triangle') 
    current_wavetype = 'triangle'
    --love.graphics.setBackgroundColor(250,0,0)
  elseif key == '2' then
    synth:stopNotesOnOctave(current_octave)
    synth:set_wavetype('square')
    current_wavetype = 'square'
  elseif key == '3' then
    synth:stopNotesOnOctave(current_octave)
    synth:set_wavetype('sinus')
    current_wavetype = 'sine'
  elseif key == '4' then
    synth:stopNotesOnOctave(current_octave)
    synth:set_wavetype('sawtooth')
    current_wavetype = 'sawtooth'
  elseif key == '5' then
    synth:stopNotesOnOctave(current_octave)
    synth:set_wavetype('whitenoise')
    current_wavetype = 'whitenoise'
  elseif key == '6' then
    synth:stopNotesOnOctave(current_octave)
    synth:set_wavetype('pinknoise')
    current_wavetype = 'pinknoise'

  --elseif key == '0' then
    --synth:playBB()
  end
end

function love.keyreleased(key)
	if keyboard_bind[key] then
		synth:stopNote(keyboard_bind[key]..current_octave)
	end
end



-- show informations
--need pages and page switching

--Project           Groove
--   |                |
-- Song - Pattern - Chain - Instrument
--                              |
--                            Table

--PRJ SNG PTN GRV CHN INS TBL

function love.draw()
	love.graphics.printf('LOVE synthesizer',0,0,320, 'center')
	love.graphics.printf('use : z-m to play \n\n up/down to change octaves \n\n and 1-6 to select waveforms', 0, 30, 320, 'center')
  love.graphics.printf('octave\nwaveform\neffect', 0, 240, 320)
  love.graphics.printf(current_octave, 70, 240, 320)
  love.graphics.printf(current_wavetype, 70, 254, 320)
  love.graphics.printf('none', 70, 268, 320)
end

--file management?
--timing

