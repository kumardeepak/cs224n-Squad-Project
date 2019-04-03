help:
	@echo "    train-bidaf"
	@echo "        Train the BIDAF model using SQUADv1.1."
	@echo "    run-cmdline"
	@echo "        Starts the REST server on the command line"

train-bidaf:
	nohup python src/main.py --experiment_name=bidaf_best --dropout=0.15 --batch_size=60 --hidden_size_encoder=150 --embedding_size=100 --do_char_embed=False --add_highway_layer=True --rnet_attention=False --bidaf_attention=True --answer_pointer_RNET=False --smart_span=True --hidden_size_modeling=150 --mode=train &
run-cmdline:
	nohup python src/app.py --experiment_name=bidaf_best --ckpt_load_dir=experiments/bidaf_best/best_checkpoint &