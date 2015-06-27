json.array!(@tareas) do |tarea|
  json.extract! tarea, :id, :title, :notes
  json.url tarea_url(tarea, format: :json)
end
