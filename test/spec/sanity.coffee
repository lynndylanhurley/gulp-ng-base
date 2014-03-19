describe 'testing coffee specs', ->
  it 'should be sane', ->
    expect(1).toEqual(1)


describe 'testing angular deps', ->
  it 'should define angular', ->
    console.log 'htmls', window.__html__
    expect(angular).toBeDefined()
