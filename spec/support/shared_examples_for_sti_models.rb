shared_examples_for 'sti model' do 

  it 'should have type attribute setted to class name' do 
    expect(subject.type).to eq(subject.class.name)
  end

end