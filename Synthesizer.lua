local class = require 'lib.middleclass'
local denver = require 'lib.denver'
local fx = require 'Effects'

local Synthesizer = class('Synthesizer')

function Synthesizer:initialize(waveform_type)
	self.notes = {}

	for i=0,8 do
		self.notes['A'..i] = denver.get(waveform_type, 'A'..i)
		self.notes['A#'..i] = denver.get(waveform_type, 'A#'..i)
		self.notes['B'..i] = denver.get(waveform_type, 'B'..i)
		self.notes['C'..i] = denver.get(waveform_type, 'C'..i)
		self.notes['C#'..i] = denver.get(waveform_type, 'C#'..i)
		self.notes['D'..i] = denver.get(waveform_type, 'D'..i)
		self.notes['D#'..i] = denver.get(waveform_type, 'D#'..i)
		self.notes['E'..i] = denver.get(waveform_type, 'E'..i)
		self.notes['F'..i] = denver.get(waveform_type, 'F'..i)
		self.notes['F#'..i] = denver.get(waveform_type, 'F#'..i)
		self.notes['G'..i] = denver.get(waveform_type, 'G'..i)
		self.notes['G#'..i] = denver.get(waveform_type, 'G#'..i)
	end

end

love.audio.setEffect('myEffect', {
	type = 'flanger',
  waveform = 'sine',
	phase = 2,
	rate = .5,
  depth = 2
})

function Synthesizer:playNote(note)
	self.notes[note]:setLooping(true)
  self.notes[note]:setEffect('myEffect')
	love.audio.play(self.notes[note])
end

function Synthesizer:stopNote(note)
	self.notes[note]:setLooping(false)
	love.audio.stop(self.notes[note])
end

function Synthesizer:set_wavetype(waveform_type)
  	self.notes = {}

	for i=0,8 do
		self.notes['A'..i] = denver.get(waveform_type, 'A'..i)
		self.notes['A#'..i] = denver.get(waveform_type, 'A#'..i)
		self.notes['B'..i] = denver.get(waveform_type, 'B'..i)
		self.notes['C'..i] = denver.get(waveform_type, 'C'..i)
		self.notes['C#'..i] = denver.get(waveform_type, 'C#'..i)
		self.notes['D'..i] = denver.get(waveform_type, 'D'..i)
		self.notes['D#'..i] = denver.get(waveform_type, 'D#'..i)
		self.notes['E'..i] = denver.get(waveform_type, 'E'..i)
		self.notes['F'..i] = denver.get(waveform_type, 'F'..i)
		self.notes['F#'..i] = denver.get(waveform_type, 'F#'..i)
		self.notes['G'..i] = denver.get(waveform_type, 'G'..i)
		self.notes['G#'..i] = denver.get(waveform_type, 'G#'..i)
	end
  --denver.set
end

function Synthesizer:playBB()
    denver.playBinauralBeat(0,440,play_noise)
end

function Synthesizer:stopNotesOnOctave(octave) --fix to avoid blocked notes
	self:stopNote('A'..octave)
	self:stopNote('A#'..octave)
	self:stopNote('B'..octave)
	self:stopNote('C'..octave)
	self:stopNote('C#'..octave)
	self:stopNote('D'..octave)
	self:stopNote('D#'..octave)
	self:stopNote('E'..octave)
	self:stopNote('F'..octave)
	self:stopNote('F#'..octave)
	self:stopNote('G'..octave)
	self:stopNote('G#'..octave)
end

return Synthesizer