package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testResourceGroup(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	name := terraform.Output(t, terraformOptions, "name")
	expectedName := fmt.Sprintf("example-tf-resource-group-%s", variant)

	assert.Equal(t, expectedName, name)

	region := getAWSRegion(t)
	accountID := getAWSAccountID(t)

	arn := terraform.Output(t, terraformOptions, "arn")
	expectedARN := fmt.Sprintf("arn:aws:resource-groups:%s:%s:group/%s", region, accountID, expectedName)

	assert.Equal(t, expectedARN, arn)
}
