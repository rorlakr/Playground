module Conway
	class Life
		def initialize cells
			@cells = cells
		end

		def xxxx(v)
			if v >= @cells.size
				v - @cells.size
			else
				v
			end
		end

		def surround_cells(x, y)
			[
				@cells[xxxx(x-1)][xxxx(y-1)],
				@cells[xxxx(x-1)][xxxx(y)],
				@cells[xxxx(x-1)][xxxx(y+1)],
				@cells[xxxx(x)][xxxx(y-1)],
				@cells[xxxx(x)][xxxx(y+1)],
				@cells[xxxx(x+1)][xxxx(y-1)],
				@cells[xxxx(x+1)][xxxx(y)],
				@cells[xxxx(x+1)][xxxx(y+1)]
			]
		end
	end
end