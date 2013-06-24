define ->
	describe 'Give it some context', ->
		describe 'maybe a bit more context here', ->

			it 'should run here few assertions', ->
	      expect(false).to.be.false

			it 'should run here few more assertions', ->
				expect(true).to.be.true

			it 'addition', ->
				expect(1 + 2).to.be.equal 3