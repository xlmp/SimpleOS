.obj/source/%.o: source/%.cpp
#	ifeq ($(ENVIRONMENT),WINDOWS)
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
#	else 
#	endif
	@$(CC) $(CCPARAMS) -c -o $@ $<

.obj/source/%.o: source/%.s
#	ifeq ($(ENVIRONMENT),WINDOWS)
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
#	else 
#	endif
	$(AS) $(ASPARAMS) -c $< -o $@