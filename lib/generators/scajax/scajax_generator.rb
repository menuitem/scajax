class ScajaxGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  #application.html.erb
  def modify_application_html_erb_file
	file_path = "app/views/layouts/application.html.erb"
	inject_into_file "#{file_path}", "\n<div id=\"scajax\"></div>", after: "<%= yield %>"
  end
  #show.js.erb
  def create_show_js_erb_file
    create_file "app/views/#{plural_name}/show.js.erb", <<-FILE
	$('#scajax').html("<%= escape_javascript(render 'show')%>")
	FILE
  end
  #destroy.js.erb
  def create_destroy_js_erb_file
    create_file "app/views/#{plural_name}/destroy.js.erb", <<-FILE
		var rowId = $('a').attr('href');
		$('table tr td').find('a[href="'+rowId+'"]').parent().parent()
			.remove();
		$('#scajax').html('');
	FILE
  end
  #edit.js.erb
  def create_edit_js_erb_file
    create_file "app/views/#{plural_name}/edit.js.erb", <<-FILE
		$("#scajax").html("<%= escape_javascript(render 'form')%>");
	FILE
  end
  #new.js.erb
  def create_new_js_erb_file
    create_file "app/views/#{plural_name}/new.js.erb", <<-FILE
		$("#scajax").html("<%= escape_javascript(render 'form')%>");
	FILE
  end
  #create.js.erb
  def create_create_js_erb_file
    create_file "app/views/#{plural_name}/create.js.erb", <<-FILE
$('table').append('<%= j render(@#{plural_name.singularize}) %>');
$("#scajax").html("<%= escape_javascript(render 'show', notice: 
"#{plural_name.singularize.capitalize} created successful.") %>");
FILE
  end
  #update.js.erb
def create_update_js_erb_file
    create_file "app/views/#{plural_name}/update.js.erb", <<-FILE 
var rowId = $('form').attr('action');
$('table tr td').find('a[href="'+rowId+'"]').
parent().parent().replaceWith("<%= escape_javascript render(@#{plural_name.singularize}) %>");
$("#scajax").html("<%= escape_javascript(render 'show', notice: "Update successful.") %>");
FILE
end
#_show.html.erb
  def create__show_html_erb_file
    file = File.open("app/views/#{plural_name}/show.html.erb","r")
    if (!file.read.include?('render'))
		file_in_array = IO.readlines("app/views/#{plural_name}/show.html.erb")
		index = 0
		file_in_array.each do |line|
		 	if (line =~/link_to(.*)/) and (!line.include?("remote")) and (!line.match(/Back/i))
		 		templine=line
	 			temp_index = index
	 			until templine.sub!(/%>/,', :remote=> true %>')
	 				temp_index +=1
	 				templine = file_in_array[temp_index]
	 			end
		 	end
	 		index +=1
	 end
		create_file "app/views/#{plural_name}/_show.html.erb","#{file_in_array.join}"
		file.close()
    end
    file = File.open("app/views/#{plural_name}/show.html.erb","w")
	file.write("<div><%= render 'show'%><div>")
	file.close()
  end
#resource_controller
 def modify_controller #adding forma.js ir rails version <4
	 	file_path = "app/controllers/#{plural_name}_controller.rb"
	 	file_in_array = IO.readlines(file_path)
	 	index = 0
	 	file_in_array.each do |line|
	 		if (line =~/format.json(.*)/)
	 			if !file_in_array[index+1].include?('format.js')
	 				file_in_array.insert(index+1,"      format.js")
	 			end
	 		end
	 		index+=1
	 	end
	 	file = File.open(file_path,"w")
	 	file.puts file_in_array
	 	file.close
 end
 #index.htm.erb
 def modify_index_file #add remote:true
 	file_path = "app/views/#{plural_name}/index.html.erb"
 	file_in_array = IO.readlines(file_path)
 	index = 0
 	file_in_array.each do |line|
	 	if (line =~/link_to(.*)/) and (!line.include?("remote"))
	 		templine=line
	 		temp_index = index
	 		until templine.sub!(/%>/,', :remote=> true %>')
	 			temp_index +=1
	 			templine = file_in_array[temp_index]
	 		end
	 		# file_in_array.delete_at(index)
	 		# file_in_array.insert(index, templine)
	 		# puts templine
	 	end
	 	index +=1
	 end
	file = File.open(file_path,"w")
	file.puts file_in_array
	file.close 
 end
#_form.html.erb
 def modify__form_file #add remote:true
 	file_path = "app/views/#{plural_name}/_form.html.erb"
 	file_in_array = IO.readlines(file_path)
 	index = 0
 	file_in_array.each do |line|
	 	if (line =~/form_for(.*)/) and (!line.include?("remote"))
	 		templine=line
	 		templine.sub!("@#{plural_name.singularize}","@#{plural_name.singularize}, :remote=> true")
	 		file_in_array.delete_at(index)
	 		file_in_array.insert(index, templine)
	 		# puts templine
	 	end
	 	index +=1
	 end
	file = File.open(file_path,"w")
	file.puts file_in_array
	file.close 
 end
 #_resource.html.erb
	def create_instance_partial_html_erb_file
	 	file_path = "app/views/#{plural_name}/index.html.erb"
	    file_in_array = IO.readlines(file_path)
	    index, start_copy, stop_copy = 0
	    file_in_array.each do |line|
	    	if (line.include?("@#{plural_name.singularize}"))
	    		start_copy = index+1
	    	end
			if (line.include?("<% end %>"))
		    	stop_copy = index
		   	end
	    	index +=1
	    end
	    out_file = []
	    (start_copy...stop_copy).each{|i| out_file<<file_in_array[i]}
		out_file.each do |line|
			line.gsub!(" #{plural_name.singularize}."," @#{plural_name.singularize}.")	
			line.gsub!("(#{plural_name.singularize}","(@#{plural_name.singularize}")	
		end
		file_path = "app/views/#{plural_name}/_#{plural_name.singularize}.html.erb"
	    file = File.open(file_path,"w")
		file.puts out_file
		file.close
	end
end
