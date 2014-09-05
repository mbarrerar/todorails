json.array!(@tareas) do |tarea|
  json.extract! tarea, :id, :nombre, :terminada
  json.url tarea_url(tarea, format: :json)
end
