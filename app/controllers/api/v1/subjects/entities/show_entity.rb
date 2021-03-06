class API::V1::Subjects::Entities::ShowEntity< API::V1::BaseEntity
  root 'subjects', 'subject'
  def self.entity_name
    'show_subject'
  end
  expose :id, documentation: { type: 'String', desc: "ID" }, format_with: :string
  expose :name, documentation: { type: 'String', desc: "Nazwa przedmiotu" }, format_with: :string
  expose :exam_date_first, documentation: { type: 'String', desc: "Data pierwszego terminu" }, format_with: :string
  expose :exam_date_second, documentation: { type: 'String', desc: "Data drugiego terminu" }, format_with: :string
  expose :time_to_exam, documentation: { type: 'String', desc: "Pozostało do egzaminu" }, format_with: :string
  expose :tasks_size, documentation: { type: 'Integer', desc: "Liczba zadań" }, format_with: :integer
  expose :cards_size, documentation: { type: 'Integer', desc: "Liczba fiszek" }, format_with: :integer
  expose :solutions_size, documentation: { type: 'Integer', desc: "Liczba rozwiązań" }, format_with: :integer
  expose :students_size, documentation: { type: 'Integer', desc: "Liczba zapisanych studentów" }, format_with: :integer
end

private

def time_to_exam
  object.decorate.time_to_exam
end

def exam_date_first
	object.exam_date_first
end

def exam_date_second
	object.exam_date_first
end

def students_size
	object.tickets.accepted_menage.size
end