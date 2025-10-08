setup:
	npm add -D vitepress

WANAKU_ROUTER_VERSIONS=0.0.6 0.0.7
DEMOS_DIR=demos
VERSIONS_DIR=version
TOOLSETS_DIR=toolsets

WCJSDK_VERSIONS=main
WCJSDK_DIR=java-sdk

CAMEL_INTEGRATION_CAPABILITY_VERSIONS=main
CAMEL_INTEGRATION_CAPABILITY=camel-integration-capability

.PHONY: docs demos

$(WANAKU_ROUTER_VERSIONS):
	@if [ ! -e $(VERSIONS_DIR)/wanaku-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku $(VERSIONS_DIR)/wanaku-$(@) ; \
  	fi
	@if [ ! -e $(DEMOS_DIR)/wanaku-demos-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku-demos $(DEMOS_DIR)/wanaku-demos-$(@) || true ; \
  	fi
	@if [ ! -e $(TOOLSETS_DIR)/wanaku-toolsets-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku-toolsets $(TOOLSETS_DIR)/wanaku-toolsets-$(@) || true ; \
  	fi

router-main:
	@if [ ! -e $(VERSIONS_DIR)/wanaku-main ]; then \
  		git clone --branch main https://github.com/wanaku-ai/wanaku $(VERSIONS_DIR)/wanaku-main ; \
  	fi ;

demos-main:
	@if [ ! -e $(DEMOS_DIR)/wanaku-demos-main ]; then \
		git clone --branch main https://github.com/wanaku-ai/wanaku-demos $(DEMOS_DIR)/wanaku-demos-main ; \
	fi

toolsets-main:
	@if [ ! -e $(TOOLSETS_DIR)/wanaku-toolsets-main ]; then \
		git clone --branch main https://github.com/wanaku-ai/wanaku-toolsets $(TOOLSETS_DIR)/wanaku-toolsets-main ; \
	fi

$(WCJSDK_VERSIONS):
	@if [ ! -e $(WCJSDK_DIR)/wanaku-capabilities-java-sdk ]; then \
		git clone --branch main https://github.com/wanaku-ai/wanaku-capabilities-java-sdk $(WCJSDK_DIR)/wanaku-capabilities-java-sdk ; \
	fi

wanaku-capabilities-java-sdk: $(WCJSDK_VERSIONS)

$(CAMEL_INTEGRATION_CAPABILITY_VERSIONS):
	@if [ ! -e $(CAMEL_INTEGRATION_CAPABILITY)/camel-integration-capability-$(@) ]; then \
		git clone --branch $(@) https://github.com/wanaku-ai/camel-integration-capability $(CAMEL_INTEGRATION_CAPABILITY)/camel-integration-capability-$(@) ; \
	fi

camel-integration-capability: $(CAMEL_INTEGRATION_CAPABILITY_VERSIONS)

main: router-main demos-main toolsets-main wanaku-capabilities-java-sdk camel-integration-capability

fetch: $(WANAKU_ROUTER_VERSIONS) main

docs: fetch
	npm run docs:build

clean:
	@rm -rf $(VERSIONS_DIR)/wanaku-*
	@rm -rf $(DEMOS_DIR)/wanaku-*
	@rm -rf $(TOOLSETS_DIR)/wanaku-*
	@rm -rf $(WCJSDK_DIR)/wanaku-*
	@rm -rf $(CAMEL_INTEGRATION_CAPABILITY)/camel-*
	@rm -rf docs

serve:
	npm run docs:dev