tell application "Xcode"	activate	if not (exists active project document) then �		error "No active project. Please open an Xcode project and re-run the script."	set mainWindowFilePath to associated file name of main window	if mainWindowFilePath does not end with ".xcdatamodel" then �		error "Please open an .xcdatamodel file and re-run the script."	tell item 1 of (every data model document whose path is mainWindowFilePath)		using terms from application "Finder"			display alert "Autocustomize Entity Classes" message "Automatically customize all generic entity classes based on their names? (This is undoable.)" buttons {"Cancel", "Auto-customize"} cancel button 1		end using terms from		if button returned of result is "Auto-customize" then			repeat with entityIt in (every entity)				set object class of entityIt to name of entityIt & "MO"			end repeat		end if	end tellend tellactivate