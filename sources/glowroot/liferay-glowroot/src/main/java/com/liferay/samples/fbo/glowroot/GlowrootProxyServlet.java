package com.liferay.samples.fbo.glowroot;

import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.mitre.dsmiley.httpproxy.ProxyServlet;
import org.osgi.service.component.annotations.Component;

@Component(
	    immediate = true,
	    property = {
	        "osgi.http.whiteboard.context.path=/",
	        "osgi.http.whiteboard.servlet.pattern=/glowroot/*",
	        "servlet.init.targetUri=http://localhost:4000/o/glowroot"
	    },
	    service = Servlet.class
	)
public class GlowrootProxyServlet extends ProxyServlet {
	
	@Override
	protected void service(HttpServletRequest servletRequest, HttpServletResponse servletResponse)
			throws ServletException, IOException {

		GzipEncodingRequestWrapper wrapper = new GzipEncodingRequestWrapper(servletRequest);
		super.service(wrapper, servletResponse);
		
	}
	
	// Need to remove the Accept-Encoding header because gzip breaks the ProxyServlet
	private class GzipEncodingRequestWrapper extends HttpServletRequestWrapper {
	    
		public GzipEncodingRequestWrapper(HttpServletRequest request) {
	        super(request);
	    }

	    private Set<String> headerNameSet;

	    @Override
	    public Enumeration<String> getHeaderNames() {
	        if (headerNameSet == null) {
	            // first time this method is called, cache the wrapped request's header names:
	            headerNameSet = new HashSet<>();
	            Enumeration<String> wrappedHeaderNames = super.getHeaderNames();
	            while (wrappedHeaderNames.hasMoreElements()) {
	                String headerName = wrappedHeaderNames.nextElement();
	                if (!"Accept-Encoding".equalsIgnoreCase(headerName)) {
	                    headerNameSet.add(headerName);
	                }
	            }
	        }
	        return Collections.enumeration(headerNameSet);
	    }

	    @Override
	    public Enumeration<String> getHeaders(String name) {
	        if ("Accept-Encoding".equalsIgnoreCase(name)) {
	            return Collections.<String>emptyEnumeration();
	        }
	        return super.getHeaders(name);
	    }

	    @Override
	    public String getHeader(String name) {
	        if ("Accept-Encoding".equalsIgnoreCase(name)) {
	            return null;
	        }
	        return super.getHeader(name);
	    }
	}
}