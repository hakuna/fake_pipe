require 'spec_helper'

module FakePipe
  describe Mutator do
    context 'happy path' do
      it 'lists mutators' do
        expect(described_class.list)
          .to contain_exactly('address_city', 'address_country', 'address_line_1', 'address_line_2', 'address_postcode', 'address_state', 'bcrypt_password', 'bcrypt_salt', 'clean_phone_number', 'company_catch_phrase', 'company_name', 'email', 'empty_curly', 'empty_bracket', 'empty_string', 'first_name', 'full_name', 'last_name', 'lorem_paragraph', 'lorem_sentence', 'lorem_word', 'md5', 'phone_ext', 'phone_number', 'url', 'user_name', 'uuid', 'guid', 'ugcid')
      end

      context '#mutate_clean_phone_number' do
        it 'matches proper format' do
          expect(described_class.mutate('clean_phone_number', 'dont_care')).to match /[0-9]{9}/
        end
      end

      context '#mutate_email' do
        it 'matches proper format' do
          expect(described_class.mutate('email', 'dont_care')).to match /[a-zA-Z]+@[a-zA-Z]+.[a-zA-Z]+/
        end
      end

      context '#mutate_user_name' do
        it 'matches proper format' do
          expect(described_class.mutate('user_name', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_url' do
        it 'matches proper format' do
          expect(described_class.mutate('url', 'dont_care')).to match /[a-zA-Z]+.[a-zA-Z]+/
        end
      end

      context '#mutate_md5' do
        it 'returns nil without cell' do
          expect(described_class.mutate('md5', nil)).to eq nil
        end

        it 'returns Digest::MD5 of cell when present' do
          expect(described_class.mutate('md5', 'value_of_cell')).to eq Digest::MD5.base64digest('value_of_cell')
        end
      end

      context '#mutate_address_line_1' do
        it 'matches proper format' do
          expect(described_class.mutate('address_line_1', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_address_line_2' do
        it 'matches proper format' do
          expect(described_class.mutate('address_line_2', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_address_country' do
        it 'matches proper format' do
          expect(described_class.mutate('address_country', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_address_city' do
        it 'matches proper format' do
          expect(described_class.mutate('address_city', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_address_state' do
        it 'matches proper format' do
          expect(described_class.mutate('address_state', 'dont_care')).to match /[a-zA-Z]{2}/
        end
      end

      context '#mutate_address_postcode' do
        it 'matches proper format' do
          expect(described_class.mutate('address_postcode', 'dont_care')).to match /[0-9]+/
        end
      end

      context '#mutate_company_name' do
        it 'matches proper format' do
          expect(described_class.mutate('company_name', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_company_catch_phrase' do
        it 'matches proper format' do
          expect(described_class.mutate('company_catch_phrase', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_empty_string' do
        it 'matches proper format' do
          expect(described_class.mutate('empty_string', 'dont_care')).to eq ''
        end
      end

      context '#mutate_lorem_paragraph' do
        it 'matches proper format' do
          expect(described_class.mutate('lorem_paragraph', 'dont_care')).to match /[a-zA-Z]+. [a-zA-Z]+./
        end
      end

      context '#mutate_lorem_sentence' do
        it 'matches proper format' do
          expect(described_class.mutate('lorem_sentence', 'dont_care')).to match /[a-zA-Z]+./
        end
      end

      context '#mutate_lorem_word' do
        it 'matches proper format' do
          expect(described_class.mutate('lorem_word', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_first_name' do
        it 'matches proper format' do
          expect(described_class.mutate('first_name', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_last_name' do
        it 'matches proper format' do
          expect(described_class.mutate('last_name', 'dont_care')).to match /[a-zA-Z]+/
        end
      end

      context '#mutate_full_name' do
        it 'matches proper format' do
          expect(described_class.mutate('full_name', 'dont_care')).to match /[a-zA-Z]+[a-zA-Z]+/
        end
      end

      context '#mutate_phone_ext' do
        it 'matches proper format' do
          expect(described_class.mutate('phone_ext', 'dont_care')).to match /[0-9]+/
        end
      end

      context '#mutate_bcrypt_password' do
        it 'matches proper format' do
          expect(described_class.mutate('bcrypt_password', 'dont_care')).to eq '400$8$2d$f6ed5a490c441958$67f59aa61bc617849a3280b5e80f78607e53b5aa5807a44ddbc53e804e2e2a99'
        end
      end

      context '#mutate_bcrypt_salt' do
        it 'matches proper format' do
          expect(described_class.mutate('bcrypt_salt', 'dont_care')).to eq 'au6lOASvp17AGsqkmE7'
        end
      end

      context '#mutate_phone_number' do
        it 'matches proper format' do
          expect(described_class.mutate('phone_number', 'dont_care')).to match /[0-9]{4}/
        end
      end

      context '#mutate_uuid' do
        it 'matches proper format' do
          expect(described_class.mutate('uuid', 'dont_care')).to match /[0-9a-z]{8}-[0-9a-z]{4}-[0-9a-z]{4}-[0-9a-z]{4}-[0-9a-z]{12}/
        end
      end

      context '#mutate_guid' do
        it 'matches proper format' do
          expect(described_class.mutate('guid', 'dont_care')).to match /[0-9a-z]{8}-[0-9a-z]{4}-[0-9a-z]{4}-[0-9a-z]{4}-[0-9a-z]{12}/
        end
      end

      context '#mutate_ugcid' do
        it 'matches proper format' do
          expect(described_class.mutate('ugcid', 'dont_care')).to match /[A-Z]{6}[0-9]{4}/
        end
      end

      context '#mutate_empty_curly' do
        it 'matches proper format' do
          expect(described_class.mutate('empty_curly', 'dont_care')).to eq '{}'
        end
      end

      context '#mutate_empty_bracket' do
        it 'matches proper format' do
          expect(described_class.mutate('empty_bracket', 'dont_care')).to eq '[]'
        end
      end
    end

    context 'sad path' do
      it 'provides reasonable error message' do
        expect { described_class.mutate('i_dont_exist', 'dont_care') }
          .to raise_error(/#{described_class.list.join(', ')}/)
      end
    end
  end
end