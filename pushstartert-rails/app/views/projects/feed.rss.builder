xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "New PushStarter Projects"
    xml.description "Hello world"
    xml.link "/projects/news"

    for project in @projects
      xml.item do
        xml.title project.name
        xml.description "Project Description"
      end
    end

  end
end
