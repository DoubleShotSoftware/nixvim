{...}: {
	opts = {
    enable = false;
    mode = "symbol";
		cmp = {
			enable = false;
    after = ''
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			function(entry, vim_item)
				return vim_item
			end
    '';
			ellipsisChar = "...";
			# maxWidth = 60;
		};

	};

}
