setup:
	npm add -D vitepress
	npm i vitepress-plugin-mermaid mermaid -D

WANAKU_ROUTER_VERSIONS=0.1.1
DEMOS_DIR=demos
DEMOS_VERSIONS=0.1.1
VERSIONS_DIR=version

WCJSDK_VERSIONS=0.1.1
WCJSDK_DIR=java-sdk

CAMEL_INTEGRATION_CAPABILITY_VERSIONS=0.1.1 main
CAMEL_INTEGRATION_CAPABILITY_DIR=camel-integration-capability

.PHONY: docs demos

$(WANAKU_ROUTER_VERSIONS):
	@if [ ! -e $(VERSIONS_DIR)/wanaku-$(@) ]; then \
  		git clone --branch wanaku-$(@) https://github.com/wanaku-ai/wanaku $(VERSIONS_DIR)/wanaku-$(@) ; \
  	fi
router-main:
	@if [ ! -e $(VERSIONS_DIR)/wanaku-main ]; then \
  		git clone --branch main https://github.com/wanaku-ai/wanaku $(VERSIONS_DIR)/wanaku-main ; \
  	fi ;

wanaku-demos-$(DEMOS_VERSIONS):
	@if [ ! -e $(DEMOS_DIR)/$(@) ]; then \
		git clone --branch $(@) https://github.com/wanaku-ai/wanaku-demos $(DEMOS_DIR)/$(@) ; \
	fi

demos-main:
	@if [ ! -e $(DEMOS_DIR)/wanaku-demos-main ]; then \
		git clone --branch main https://github.com/wanaku-ai/wanaku-demos $(DEMOS_DIR)/wanaku-demos-main ; \
	fi

demos: wanaku-demos-$(DEMOS_VERSIONS) demos-main

wanaku-capabilities-java-sdk-$(WCJSDK_VERSIONS):
	@if [ ! -e $(WCJSDK_DIR)/$(@) ]; then \
		git clone --branch $(@) https://github.com/wanaku-ai/wanaku-capabilities-java-sdk $(WCJSDK_DIR)/$(@) ; \
	fi

wanaku-capabilities-java-sdk: wanaku-capabilities-java-sdk-$(WCJSDK_VERSIONS)
	@if [ ! -e $(WCJSDK_DIR)/wanaku-capabilities-java-sdk-main ]; then \
		git clone --branch main https://github.com/wanaku-ai/wanaku-capabilities-java-sdk $(WCJSDK_DIR)/wanaku-capabilities-java-sdk-main ; \
	fi


camel-integration-capability-$(CAMEL_INTEGRATION_CAPABILITY_VERSIONS):
	@if [ ! -e $(CAMEL_INTEGRATION_CAPABILITY_DIR)/$(@) ]; then \
		git clone --branch $(@) https://github.com/wanaku-ai/camel-integration-capability $(CAMEL_INTEGRATION_CAPABILITY_DIR)/$(@) ; \
	fi

camel-integration-capability: camel-integration-capability-$(CAMEL_INTEGRATION_CAPABILITY_VERSIONS)
	@if [ ! -e $(CAMEL_INTEGRATION_CAPABILITY_DIR)/camel-integration-capability-main ]; then \
		git clone --branch main https://github.com/wanaku-ai/camel-integration-capability $(CAMEL_INTEGRATION_CAPABILITY_DIR)/camel-integration-capability-main ; \
	fi

main: router-main demos-main camel-integration-capability wanaku-capabilities-java-sdk

fetch: $(WANAKU_ROUTER_VERSIONS) demos main

docs: fetch
	npm run docs:build

clean:
	@rm -rf $(VERSIONS_DIR)/wanaku-*
	@rm -rf $(DEMOS_DIR)/wanaku-*
	@rm -rf $(WCJSDK_DIR)/wanaku-*
	@rm -rf $(CAMEL_INTEGRATION_CAPABILITY_DIR)/camel-*
	@rm -rf docs

serve:
	npm run docs:dev