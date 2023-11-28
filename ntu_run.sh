conda activate alphapose

for f in /mnt/h/Datasets/NTU/rgb_img_single/test/*;
do
        name=$(basename $f)
        if [ ! -e "/mnt/h/Datasets/NTU/motionbert_json/test/$name/alphapose-results.json" ]
        then
                echo Start processing file $name
                echo 
                echo
                python scripts/demo_inference.py --indir $name --cfg configs/halpe_26/resnet/256x192_res50_lr1e-3_1x.yaml --checkpoint pretrained_models/halpe26_fast_res50_256x192.pth
        else
                echo File $name already exists
                echo
        fi
done

conda deactivate