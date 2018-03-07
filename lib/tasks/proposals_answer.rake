namespace :proposals_answer do
  # Add answers with a CSV using this columns (id,state,answer) the valid states are (accepted,rejected and evaluating)
  desc "Add answers to proposals from a CSV file"
  task add: :environment do
    CSV.foreach(ARGV[1], headers: true) do |row|
      proposal = Decidim::Proposals::Proposal.find(row['id']) rescue nil
      unless proposal.nil?
        proposal.update state: row['state'], answer: {"es": "#{row['answer']}"}, answered_at: DateTime.now
        puts "Answered Proposal ##{proposal.id}: #{proposal.title}"
      end
    end
  end
end
