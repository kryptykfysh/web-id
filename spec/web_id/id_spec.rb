require 'spec_helper'

describe WebID::ID do
  let(:profile_uri) { 'https://identity.service.org/People/Test-Person/card' }
  let(:id_hashtag)  { 'profile' }
  let(:uri_string)  { "#{profile_uri}/##{id_hashtag}" }

  describe 'class methods' do
    subject { WebID::ID }

    it { is_expected.to respond_to :new               }

    describe '::new' do
      context 'without a URI string argument' do
        it 'raises an ArgumentError' do
          expect{ subject.new }.to raise_error ArgumentError
        end
      end

      context 'with a valid URI string argument' do
        subject { WebID::ID.new(uri_string) }

        it { is_expected.to be_an_instance_of described_class }
        it 'sets the @id_hashtag attribute' do
          expect(subject.instance_variable_get('@id_hashtag')).to eq id_hashtag
        end

        it 'sets the @profile_uri attribute' do
          expect(subject.instance_variable_get('@profile_uri')).to eq profile_uri
        end

        context 'with no id_hashtag' do
          let(:uri_string) { profile_uri + '/'}
          subject { WebID::ID.new(uri_string) }

          it 'sets the @id_hashtag attribute' do
            expect(subject.instance_variable_get('@id_hashtag')).to eq ''
          end

          it 'sets the @profile_uri attribute' do
            expect(subject.instance_variable_get('@profile_uri')).to eq uri_string.chomp('/')
          end
        end
      end
    end
  end

  describe 'instance attributes' do
    subject           { WebID::ID.new(uri_string) }

    it { is_expected.to respond_to :id_hashtag        }
    it { is_expected.to respond_to :profile_uri       }
  end

  describe 'instance methods' do
    subject           { WebID::ID.new(uri_string) }

    it { is_expected.to respond_to :uri               }

    describe '#uri' do
      context 'when @id_hashtag is an empty string' do
        before { subject.instance_variable_set('@id_hashtag', '') }

        it 'equals the @profile_uri' do
          expect(subject.uri).to eq subject.profile_uri
        end
      end

      context 'when @id_hashtag is not empty string' do
        before { subject.instance_variable_set('@id_hashtag', id_hashtag) }

        it 'returns the full uri' do
          expect(subject.uri).to eq "#{subject.profile_uri}/##{id_hashtag}"
        end
      end
    end
  end
end
