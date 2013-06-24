define ->
	describe 'Give it some context', ->
		describe 'maybe a bit more context here', ->

			it 'should run here few assertions', ->
	      false.should.be.false

			it 'should run here few more assertions', ->
				true.should.be.true

			it 'adds 2 numbers', ->
				(2 + 2).should.be.equal 4