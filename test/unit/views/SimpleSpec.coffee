define (require) ->

	describe 'Simple', ->

		it '1 + 1 = 2', ->
			(1 + 1).should.equal 2

		it 'true is not false', ->
			true.should.not.be.false