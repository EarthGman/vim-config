require("snacks").setup({
	picker = { enabled = true },
	dashboard = {
		enabled = true,
                sections = {
                  { section = "header" },
                  { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
		},
		preset = {
			header = [[
        GGGGGGGGGGGGG                                                            
     GGG::::::::::::G                                                            
   GG:::::::::::::::G                                                           
  G:::::GGGGGGGG::::G                                                           
 G:::::G       GGGGGG   mmmmmmm    mmmmmmm     aaaaaaaaaaaaa  nnnn  nnnnnnnn    
G:::::G               mm:::::::m  m:::::::mm   a::::::::::::a n:::nn::::::::nn  
G:::::G              m::::::::::mm::::::::::m  aaaaaaaaa:::::an::::::::::::::nn 
G:::::G    GGGGGGGGGGm::::::::::::::::::::::m           a::::ann:::::::::::::::n
G:::::G    G::::::::Gm:::::mmm::::::mmm:::::m    aaaaaaa:::::a  n:::::nnnn:::::n
G:::::G    GGGGG::::Gm::::m   m::::m   m::::m  aa::::::::::::a  n::::n    n::::n
G:::::G        G::::Gm::::m   m::::m   m::::m a::::aaaa::::::a  n::::n    n::::n
 G:::::G       G::::Gm::::m   m::::m   m::::ma::::a    a:::::a  n::::n    n::::n
  G:::::GGGGGGGG::::Gm::::m   m::::m   m::::ma::::a    a:::::a  n::::n    n::::n
   GG:::::::::::::::Gm::::m   m::::m   m::::ma:::::aaaa::::::a  n::::n    n::::n
     GGG::::::GGG:::Gm::::m   m::::m   m::::m a::::::::::aa:::a n::::n    n::::n
        GGGGGG   GGGGmmmmmm   mmmmmm   mmmmmm  aaaaaaaaaa  aaaa nnnnnn    nnnnnn
			]],
                        
		},
	},
})
