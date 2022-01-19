RSpec.describe Article::IndexSerializer, type: :serializer do
  let(:article) { { build_list(:article, 10) } }

  let(:serialization) do
    ActiveModelSerializers::SerializableResouce.new(
      Article.all,
      each_serializer: described_class
    )
  end
  subject { JSON.parse(serialization.to_json) }

  it 'is expected to wrap data in a key reflecting the resource name' do
    expect(subject.keys).to match ['article']
  end
end
