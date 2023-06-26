set -o nounset
set -o pipefail
set -o errexit
set -x

mv $SRC/cncf-fuzzing/projects/cubefs/fuzz_master.go $SRC/cubefs/master/

go mod download && go mod tidy
go get github.com/AdaLogics/go-fuzz-headers@latest

compile_go_fuzzer github.com/cubefs/cubefs/master FuzzCreateVol fuzz_workflow_server