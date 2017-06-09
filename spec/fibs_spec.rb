require_relative '../fibs'

describe Fibs do

  subject { Fibs.new }
  let(:gen_fib_count) { 6 }

  before do
    subject.generate(gen_fib_count)
  end

  describe '#generate' do
    let(:expected_result) { [ 0, 1, 1, 2, 3, 5 ] }

    it 'returns the number of requested fibonacci numbers' do
      expect( subject.generate(gen_fib_count) ).to eq(expected_result)
    end

    it 'stores the values' do
      expect( subject.generated_fibs ).to eq(expected_result)
    end

    context 'when it already knows the requested number of sequence numbers' do
      before do
        allow_any_instance_of(Fibs).to receive(:generate_fibs) { raise Exception }
      end

      it 'does not call generate_fibs' do
        expect { subject.generate(gen_fib_count).generate_fibs }.to raise_error
      end
    end
  end

  describe '#is_known_fib?' do
    context 'when passed a fibonacci number that it has not stored' do
      it 'returns false' do
        expect( subject.is_known_fib? 999 ).to be false
      end
    end

    context 'when passed a number that has been stored' do
      it 'returns true' do
        expect( subject.is_known_fib? 5 ).to be true
      end
    end
  end

  describe '#all_fibs?' do
    context 'when passed an array of numbers that are all members of the the fibonacci sequence' do
      it 'returns true' do
        expect( subject.all_fibs? [0,1,2,3,5] ).to be true
      end
    end

    context 'when passed an array of numbers that where at least one is not a member of the sequence' do
      it 'returns false' do
         expect( subject.all_fibs? [100,4] ).to be false
      end
    end
  end

  describe '#known_fibs_sum_of_squares' do
    let(:expected_result) { 40 }

    context 'when there are stored numbers' do
      it 'returns the sum of the squared values for all known fibs' do
        expect( subject.known_fibs_sum_of_squares ).to eq( expected_result )
      end
    end

    context 'when there are no stored numbers' do
      it 'returns 0' do
        expect( Fibs.new.known_fibs_sum_of_squares ).to eq( 0 )
      end
    end
  end
end
